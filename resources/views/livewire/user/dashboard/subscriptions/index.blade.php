<div class="container-fluid">
    @include('errors.alerts')
    <div class="row mb-4">
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <a href="{{ route('UserSubscriptions') }}">
                <div class="card">
                    <div class="card-header p-3 pt-2" style="border-radius: 0;">
                        <div
                            class="icon icon-lg icon-shape bg-gradient-primary shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                            <i class="fas fa-credit-card opacity-10"></i>
                        </div>
                        <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">
                                Subscriptions
                            </p>
                            <h4 class="mb-0">
                                {{ User::CountSubscriptions(Auth::user()) }}
                            </h4>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <a href="{{ route('UserPlatformPlans') }}">
                <div class="card">
                    <div class="card-header p-3 pt-2" style="border-radius: 0;">
                        <div
                            class="icon icon-lg icon-shape bg-gradient-primary shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                            <i class="fas fa-box-open opacity-10"></i>
                        </div>
                        <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">
                                Platform Plans
                            </p>
                            <h4 class="mb-0">
                                {{ Admin::CountActiveProducts() }}
                            </h4>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="row mt-4">
        @foreach ($subscriptions as $subscription)
            <div class="col-lg-4 mb-lg-0 mt-4">
                <div class="card shadow-lg">
                    <span class="badge rounded-pill bg-primary text-white mx-auto mt-5">
                        @if ($plan = Admin::FindProduct($subscription->name))
                            {{ $plan->name }}
                        @endif
                    </span>
                    <div class="card-header text-center pt-4 pb-3">
                        <h1 class="font-weight-bold mt-2">
                            <small class="text-lg align-top me-1">
                                @if ($price = Admin::FindPrice($subscription->stripe_price))
                                    {{ Str::upper($price->currency) }}
                                @endif
                            </small>
                            @if ($price = Admin::FindPrice($subscription->stripe_price))
                                {{ $price->unit_amount / 100 }}
                            @endif
                            <small class="text-lg">/
                                @if ($price = Admin::FindPrice($subscription->stripe_price))
                                    {{ $price->recurring->interval_count }}
                                    {{ Str::ucfirst($price->recurring->interval) }}
                                @endif
                            </small>
                        </h1>
                    </div>
                    <div class="card-body text-lg-start text-center pt-0">
                        <div class="text-center p-2 mb-2">
                            <span class="ps-3 text-dark">
                                @if ($plan = Admin::FindProduct($subscription->name))
                                    {{ $plan->description }}
                                @endif
                            </span>
                        </div>
                        <div class="justify-content-start p-2 text-center mb-2">
                            <span class="ps-3 text-dark">
                                <i class="fas fa-check text-success" aria-hidden="true"></i>
                                @if ($customers = Admin::FindProduct($subscription->name)->metadata->customers)
                                    {{ $customers }} Customers
                                @else
                                    Unlimited Customers
                                @endif
                            </span>
                        </div>
                        <div class="justify-content-start p-2 text-center mb-2">
                            <span class="ps-3 text-dark">
                                <i class="fas fa-check text-success" aria-hidden="true"></i>
                                @if ($deadlines = Admin::FindProduct($subscription->name)->metadata->deadlines)
                                    {{ $deadlines }} Deadlines
                                @else
                                    Unlimited Deadlines
                                @endif
                            </span>
                        </div>
                        <!--Begin::If not ended-->
                        @if ($subscription->stripe_status == 'active')
                            <!--Begin::If canceled-->
                            @if (Auth::user()->subscription($subscription->name)->canceled())
                                <td class="align-middle">
                                    <form wire:submit.prevent='Resume("{{ $subscription->name }}")'>
                                        <button type="submit" class="btn btn-sm btn-info" style="width:100%;">
                                            <span wire:loading wire:target='Resume("{{ $subscription->name }}")'
                                                class="spinner-border spinner-border-sm" role="status"
                                                aria-hidden="true"></span>
                                            Resume
                                        </button>
                                    </form>
                                </td>
                            @else
                                <td class="align-middle">
                                    <form wire:submit.prevent='Cancel("{{ $subscription->name }}")'>
                                        <button type="submit" class="btn btn-danger" style="width:100%;">
                                            <span wire:loading wire:target='Cancel("{{ $subscription->name }}")'
                                                class="spinner-border spinner-border-sm" role="status"
                                                aria-hidden="true"></span>
                                            Cancel
                                        </button>
                                    </form>
                                </td>
                            @endif
                            <!--End::If canceled-->

                            <!--If ended-->
                        @else
                            @if ($subscription->stripe_status !== 'canceled')
                                <td class="align-middle">
                                    <button class="btn btn-danger disabled" style="width:100%;">
                                        Actions
                                    </button>
                                </td>
                            @endif
                        @endif


                        <!--Begin::If not ended-->
                        @if ($subscription->stripe_status == 'canceled')
                            <td class="align-middle">
                                <button class="btn btn-danger disabled" style="width:100%;">
                                    Ended
                                </button>
                            </td>
                        @else
                            <td class="align-middle">
                                <form wire:submit.prevent='End("{{ $subscription->name }}")'>
                                    <button type="submit" class="btn btn-danger" style="width:100%;">
                                        <span wire:loading wire:target='End("{{ $subscription->name }}")'
                                            class="spinner-border spinner-border-sm" role="status"
                                            aria-hidden="true"></span>
                                        End
                                    </button>
                                </form>
                            </td>
                        @endif
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>
