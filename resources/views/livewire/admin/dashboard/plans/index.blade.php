<div class="container-fluid">
    @include('errors.alerts')
    <div class="row mb-4">
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <a href="{{ route('AdminPlans') }}">
                <div class="card">
                    <div class="card-header p-3 pt-2" style="border-radius: 0;">
                        <div
                            class="icon icon-lg icon-shape bg-gradient-primary shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                            <i class="fas fa-box-open opacity-10"></i>
                        </div>
                        <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">Plans</p>
                            <h4 class="mb-0">
                                @if ($prices)
                                    {{ Admin::CountProducts() }}
                                @else
                                    0
                                @endif
                            </h4>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <a href="{{ route('AdminAddPlan') }}">
                <div class="card">
                    <div class="card-header p-3 pt-2" style="border-radius: 0;">
                        <div
                            class="icon icon-lg icon-shape bg-gradient-primary shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                            <i class="fas fa-plus opacity-10"></i>
                        </div>
                        <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">
                                Add New
                            </p>
                            <h4 class="mb-0">
                                Plan
                            </h4>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <div class="card my-4">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                        <h6 class="text-white text-capitalize ps-3">
                            Plans
                        </h6>
                    </div>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
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
                                        Status
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Price
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Type
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Duration
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Actions
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Edit
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @if ($prices)
                                    @foreach ($prices as $price)
                                        <tr>
                                            <td class="align-middle">
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">
                                                            {{ $loop->iteration }}
                                                        </h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="align-middle">
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">
                                                            @if ($product = Admin::FindProduct($price->product))
                                                                {{ $product->name }}
                                                            @else
                                                                {{ __('NOT FOUND') }}
                                                            @endif
                                                        </h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="align-middle">
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
                                                        @if ($product = Admin::FindProduct($price->product)->active)
                                                            <span class="badge bg-primary">
                                                                Active
                                                            </span>
                                                        @else
                                                            <span class="badge bg-danger">
                                                                Archived
                                                            </span>
                                                        @endif
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="align-middle">
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">
                                                            {{ $price->unit_amount / 100 }}
                                                            {{ strtoupper($price->currency) }}
                                                        </h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="align-middle">
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
                                                        @if ($price->type == 'recurring')
                                                            <span class="badge bg-info">
                                                                Recurring
                                                            </span>
                                                        @else
                                                            <span class="badge bg-info">
                                                                One Time
                                                            </span>
                                                        @endif
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="align-middle">
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
                                                        @if ($price->type == 'recurring')
                                                            <h6 class="mb-0 text-sm">
                                                                {{ strtoupper($price->recurring->interval_count) }}
                                                                {{ ucfirst($price->recurring->interval) }}
                                                            </h6>
                                                        @else
                                                            <span class="badge bg-info">
                                                                One Time
                                                            </span>
                                                        @endif
                                                    </div>
                                                </div>
                                            </td>
                                            @if ($product = Admin::FindProduct($price->product)->active)
                                                <td class="align-middle">
                                                    <form wire:submit.prevent='Archive("{{ $price->id }}")'>
                                                        <button class="btn btn-sm btn-danger">
                                                            <span wire:loading
                                                                wire:target='Archive("{{ $price->id }}")'
                                                                class="spinner-border spinner-border-sm" role="status"
                                                                aria-hidden="true"></span>
                                                            Archive
                                                        </button>
                                                    </form>
                                                </td>
                                            @else
                                                <td class="align-middle">
                                                    <form wire:submit.prevent='Activate("{{ $price->id }}")'>
                                                        <button type="submit" class="btn btn-sm btn-info">
                                                            <span wire:loading
                                                                wire:target='Activate("{{ $price->id }}")'
                                                                class="spinner-border spinner-border-sm" role="status"
                                                                aria-hidden="true"></span>
                                                            Activate
                                                        </button>
                                                    </form>
                                                </td>
                                            @endif
                                            <td class="align-middle">
                                                <form wire:submit.prevent='Edit("{{ $price->id }}")'>
                                                    <button type="submit" class="btn btn-sm btn-info">
                                                        <span wire:loading wire:target='Edit("{{ $price->id }}")'
                                                            class="spinner-border spinner-border-sm" role="status"
                                                            aria-hidden="true"></span>
                                                        Edit
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
                                @endif
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer text-center">
                    @if ($prices)
                        @if ($prices->count() < Admin::CountProducts())
                            <form wire:submit.prevent="LoadMore">
                                <button type="submit" class="btn btn-sm bg-gradient-primary" wire:attr='disabled'>
                                    <span wire:loading wire:target='LoadMore' class="spinner-border spinner-border-sm"
                                        role="status" aria-hidden="true">
                                    </span>
                                    Load More
                                </button>
                            </form>
                        @endif
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
