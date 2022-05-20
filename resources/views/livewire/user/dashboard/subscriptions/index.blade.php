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
        <div class="col-12">
            <div class="card my-4">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                        <h6 class="text-white text-capitalize ps-3">
                            Subscriptions
                        </h6>
                    </div>
                </div>
                <div class="card-body px-0 pb-2">
                    <div class="table-responsive p-0">
                        <table class="table align-items-center mb-0">
                            <thead>
                                <tr>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        #
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Plan
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Duration
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Price
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Date
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Status
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Customers
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Deadlines
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Actions
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        End
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($subscriptions as $subscription)
                                    <tr>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        {{ $loop->iteration }}
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        @if ($plan = Admin::FindProduct($subscription->name))
                                                            {{ $plan->name }}
                                                        @endif
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        @if ($price = Admin::FindPrice($subscription->stripe_price))
                                                            {{ $price->recurring->interval_count }}
                                                            {{ Str::ucfirst($price->recurring->interval) }}
                                                        @endif
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        @if ($price = Admin::FindPrice($subscription->stripe_price))
                                                            {{ $price->unit_amount / 100 }}
                                                            {{ Str::upper($price->currency) }}
                                                        @endif
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        {{ date('d M Y', strtotime($subscription->created_at)) }}
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="align-middle">
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <span class="badge bg-info">
                                                        {{ strtoupper($subscription->stripe_status) }}
                                                    </span>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        @if ($customers = Admin::FindProduct($subscription->name)->metadata->customers)
                                                            {{ $customers }}
                                                        @else
                                                            Unlimited
                                                        @endif
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        @if ($deadlines = Admin::FindProduct($subscription->name)->metadata->deadlines)
                                                            {{ $deadlines }}
                                                        @else
                                                            Unlimited
                                                        @endif
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <!--Begin::If not ended-->
                                        @if (!Auth::user()->subscription($subscription->name)->ended())
                                            <!--Begin::If canceled-->
                                            @if (Auth::user()->subscription($subscription->name)->canceled())
                                                <td class="align-middle">
                                                    <form wire:submit.prevent='Resume("{{ $subscription->name }}")'>
                                                        <button type="submit" class="btn btn-sm btn-info">
                                                            <span wire:loading
                                                                wire:target='Resume("{{ $subscription->name }}")'
                                                                class="spinner-border spinner-border-sm" role="status"
                                                                aria-hidden="true"></span>
                                                            Resume
                                                        </button>
                                                    </form>
                                                </td>
                                            @else
                                                <td class="align-middle">
                                                    <form wire:submit.prevent='Cancel("{{ $subscription->name }}")'>
                                                        <button type="submit" class="btn btn-sm btn-danger">
                                                            <span wire:loading
                                                                wire:target='Cancel("{{ $subscription->name }}")'
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
                                            <td class="align-middle">
                                                <button class="btn btn-sm btn-danger disabled">
                                                    Actions
                                                </button>
                                            </td>
                                        @endif
                                        <!--Begin::If not ended-->
                                        @if (Auth::user()->subscription($subscription->name)->ended())
                                            <td class="align-middle">
                                                <button class="btn btn-sm btn-danger disabled">
                                                    End
                                                </button>
                                            </td>
                                        @else
                                            <td class="align-middle">
                                                <form wire:submit.prevent='End("{{ $subscription->name }}")'>
                                                    <button type="submit" class="btn btn-sm btn-danger">
                                                        <span wire:loading
                                                            wire:target='End("{{ $subscription->name }}")'
                                                            class="spinner-border spinner-border-sm" role="status"
                                                            aria-hidden="true"></span>
                                                        End
                                                    </button>
                                                </form>
                                            </td>
                                        @endif
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer">
                    {{ $subscriptions->render() }}
                </div>
            </div>
        </div>
    </div>
</div>
