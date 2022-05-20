<div class="container-fluid">
    @include('errors.alerts')
    <div class="row">
        @if (Admin::CountActiveProducts())
            <!--Begin::Platform Prices-->
            @foreach ($prices as $price)
                <!--Begin::If Price is Active-->
                @if ($price->active)
                    <!--Begin::If Product is Active-->
                    @if ($product = Admin::FindProduct($price->product)->active)
                        <div class="col-lg-3 mb-lg-0 mt-4">
                            <div class="card shadow-lg">
                                <span class="badge rounded-pill bg-primary text-white mx-auto mt-5">
                                    @if ($product = Admin::FindProduct($price->product))
                                        {{ $product->name }}
                                    @else
                                        Not Found
                                    @endif
                                </span>
                                <div class="card-header text-center pt-4 pb-3">
                                    <h1 class="font-weight-bold mt-2">
                                        <small class="text-lg align-top me-1">
                                            {{ strtoupper($price->currency) }}
                                        </small>{{ $price->unit_amount / 100 }}
                                        @if ($price->type == 'recurring')
                                            <small class="text-lg">/
                                                {{ $price->recurring->interval_count }}
                                                {{ Str::ucfirst($price->recurring->interval) }}
                                            </small>
                                        @endif
                                    </h1>
                                </div>
                                <div class="card-body text-lg-start text-center pt-0">
                                    @if ($product = Admin::FindProduct($price->product))
                                        <div class="text-center p-2">
                                            <span class="ps-3 text-dark">
                                                {!! $product->description !!}
                                            </span>
                                        </div>
                                    @endif

                                    @if ($product = Admin::FindProduct($price->product))
                                        <div class="justify-content-start p-2">
                                            <span class="ps-3 text-dark">
                                                <i class="fas fa-check"></i>
                                                @if ($find = $product->metadata->customers)
                                                    {!! $find !!} Customers
                                                @else
                                                    Unlimited Customers
                                                @endif
                                            </span>
                                        </div>
                                    @endif

                                    @if ($product = Admin::FindProduct($price->product))
                                        <div class="justify-content-start p-2">
                                            <span class="ps-3 text-dark">
                                                <i class="fas fa-check"></i>
                                                @if ($find = $product->metadata->deadlines)
                                                    {!! $find !!} Deadlines
                                                @else
                                                    Unlimited Deadlines
                                                @endif
                                            </span>
                                        </div>
                                    @endif

                                    @if (Auth::user()->subscribed($price->product))
                                        <button type="button" style="width: 100%;"
                                            class="btn btn-lg bg-gradient-success btn-block mt-3 mb-0 disabled">
                                            <i class="fas fa-check"></i>
                                            Subscribed
                                        </button>
                                    @else
                                        @if (Auth::user()->subscriptions()->active()->count() > 0)
                                            <button type="button" style="width: 100%;"
                                                class="btn btn-lg bg-gradient-primary btn-block mt-3 mb-0 disabled">
                                                Subscribe
                                            </button>
                                        @else
                                            @if ($price->unit_amount > 0)
                                                <form wire:submit.prevent="Subscribe('{{ $price->id }}')">
                                                    <button type="submit" style="width: 100%;" wire:attrib='disabled'
                                                        class="btn btn-lg bg-gradient-primary btn-block mt-3 mb-0">
                                                        Subscribe
                                                        <span wire:loading
                                                            wire:target="Subscribe('{{ $price->id }}')"
                                                            class="spinner-border spinner-border-sm" role="status"
                                                            aria-hidden="true">
                                                        </span>
                                                    </button>
                                                </form>
                                            @else
                                                <form wire:submit.prevent="Free('{{ $price->id }}')">
                                                    <button type="submit" style="width: 100%;" wire:attrib='disabled'
                                                        class="btn btn-lg bg-gradient-primary btn-block mt-3 mb-0">
                                                        Free
                                                        <span wire:loading wire:target="Free('{{ $price->id }}')"
                                                            class="spinner-border spinner-border-sm" role="status"
                                                            aria-hidden="true">
                                                        </span>
                                                    </button>
                                                </form>
                                            @endif
                                        @endif
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endif
                    <!--End::If Product is Active-->
                @endif
                <!--End::If Price is Active-->
            @endforeach
            <!--End::Platform Prices-->
        @else
            <div class="alert alert-danger text-white text-center">
                <strong>
                    Plans will be available soon.
                </strong>
            </div>
        @endif
    </div>
</div>
