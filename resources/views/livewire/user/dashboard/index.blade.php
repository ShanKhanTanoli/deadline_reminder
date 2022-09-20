<div class="container-fluid py-4">
    <div class="row mb-5">
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-header p-3 pt-2">
                    <div
                        class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
                        <i class="fas fa-users opacity-10"></i>
                    </div>
                    <div class="text-end pt-1">
                        <p class="text-sm mb-0 text-capitalize">Customers</p>
                        <h4 class="mb-0">
                            {{ User::CountCustomers(Auth::user()->id) }}
                        </h4>
                    </div>
                </div>
                <hr class="primary horizontal my-0">
                <div class="card-footer p-3 text-center">
                    <a href="{{ route('UserCustomers') }}" class="btn bg-gradient-primary">
                        View All
                    </a>
                </div>
            </div>
        </div>
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-header p-3 pt-2">
                    <div
                        class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
                        <i class="fas fa-calendar-alt opacity-10"></i>
                    </div>
                    <div class="text-end pt-1">
                        <p class="text-sm mb-0 text-capitalize">Deadlines</p>
                        <h4 class="mb-0">
                            {{ User::CountDeadlines(Auth::user()->id) }}
                        </h4>
                    </div>
                </div>
                <hr class="primary horizontal my-0">
                <div class="card-footer p-3 text-center">
                    <a href="{{ route('UserDeadlines') }}" class="btn bg-gradient-primary">
                        View All
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-header p-3 pt-2">
                    <div
                        class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
                        <i class="fas fa-box-open opacity-10"></i>
                    </div>
                    <div class="text-end pt-1">
                        <p class="text-sm mb-0 text-capitalize">Platform Plans</p>
                        <h4 class="mb-0">
                            {{ Admin::CountActiveProducts() }}
                        </h4>
                    </div>
                </div>
                <hr class="primary horizontal my-0">
                <div class="card-footer p-3 text-center">
                    <a href="{{ route('UserPlatformPlans') }}" class="btn bg-gradient-primary">
                        View All
                    </a>
                </div>
            </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
            <div class="card">
                <div class="card-header p-3 pt-2">
                    <div
                        class="icon icon-lg icon-shape bg-gradient-primary shadow-primary text-center border-radius-xl mt-n4 position-absolute">
                        <i class="fas fa-credit-card opacity-10"></i>
                    </div>
                    <div class="text-end pt-1">
                        <p class="text-sm mb-0 text-capitalize">Subscriptions</p>
                        <h4 class="mb-0">
                            {{ User::CountSubscriptions(Auth::user()) }}
                        </h4>
                    </div>
                </div>
                <hr class="primary horizontal my-0">
                <div class="card-footer p-3 text-center">
                    <a href="{{ route('UserSubscriptions') }}" class="btn bg-gradient-primary">
                        View All
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
