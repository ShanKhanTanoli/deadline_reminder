<div class="container-fluid">
    @include('errors.alerts')
    <div class="row">
        <div class="col-12">
            <div class="card my-4">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                        <h6 class="text-white text-capitalize ps-3">
                            Add Plan
                        </h6>
                    </div>
                </div>
                <div class="card-body px-0 pb-2">
                    <div class="container">
                        <form wire:submit.prevent='Add'>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group input-group-static my-3">
                                        <label for="name">Plan Name</label>
                                        <input type="text" wire:model.defer='name' value="{{ old('name') }}"
                                            class="form-control  @error('name') is-invalid @enderror"
                                            placeholder="Plan Name">
                                        @error('name')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group input-group-static my-3">
                                        <label for="amount">Plan Price
                                            ({{ strtoupper(Admin::Currency()) }})</label>
                                        <input type="text" wire:model.defer='amount' value="{{ old('amount') }}"
                                            class="form-control  @error('amount') is-invalid @enderror"
                                            placeholder="Plan Price ({{ strtoupper(Admin::Currency()) }})">
                                        @error('amount')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="input-group input-group-static my-3">
                                        <label for="description">Plan Description</label>
                                        <textarea wire:model.defer='description' class="form-control  @error('description') is-invalid @enderror"
                                            placeholder="Plan Description">
                                            {{ old('description') }}
                                        </textarea>
                                        @error('description')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="input-group input-group-static my-3">
                                        <label for="plan_type">Plan Type</label>
                                        <select type="text" wire:model='plan_type'
                                            class="form-control  @error('plan_type') is-invalid @enderror">
                                            <option value="">Pick One</option>
                                            <option value="onetime">One Time</option>
                                            <option value="recurring">Recurring</option>
                                        </select>
                                        @error('plan_type')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-12 text-center">
                                    <span wire:loading wire:target='plan_type' class="spinner-border spinner-border-sm"
                                        role="status" aria-hidden="true">
                                    </span>
                                </div>
                                @if ($plan_type == 'recurring')
                                    <div class="col-md-6">
                                        <div class="input-group input-group-static my-3">
                                            <label for="interval-count">Interval</label>
                                            <input type="text" wire:model.defer='interval_count'
                                                value="{{ old('interval_count') }}"
                                                class="form-control  @error('interval_count') is-invalid @enderror"
                                                placeholder="Interval">
                                            @error('interval_count')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group input-group-static my-3">
                                            <label for="billing-period">Billing Period</label>
                                            <select type="text" wire:model.defer='interval'
                                                class="form-control  @error('interval') is-invalid @enderror">
                                                <option value="">Pick One</option>
                                                <option value="day">Day</option>
                                                <option value="week">Week</option>
                                                <option value="month">Month</option>
                                                <option value="year">Year</option>
                                            </select>
                                            @error('interval')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                @endif
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary" wire:attr='disabled'>
                                        <span wire:loading wire:target='Add' class="spinner-border spinner-border-sm"
                                            role="status" aria-hidden="true">
                                        </span>
                                        Save Changes
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
