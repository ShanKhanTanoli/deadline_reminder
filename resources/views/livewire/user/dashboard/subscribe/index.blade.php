<div class="container-fluid">
    @include('errors.alerts')
    <div class="row mt-3 d-flex">
        <div class="col-8">

            @if (Auth::user()->subscriptions()->active()->count() > 0)
                <!--Begin::Already has an active subscription-->
                @include(
                    'livewire.user.dashboard.subscribe.partials.active-subscription'
                )
                <!--End::Already has an active subscription-->
            @else
                <!--Begin::Payment Details-->
                @include(
                    'livewire.user.dashboard.subscribe.partials.payment-details'
                )
                <!--End::Payment Details-->
            @endif

        </div>
        <div class="col-4">
            @if($plan = Admin::FindPrice($price))
            <!--Begin::Plan Info-->
            @include('livewire.user.dashboard.subscribe.partials.plan-details')
            <!--End::Plan Info-->
            @endif
        </div>
    </div>
</div>
