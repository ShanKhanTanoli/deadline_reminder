<div class="container-fluid">
    @include('errors.alerts')
    <div class="row mb-4">
        <div class="col-xl-4 col-sm-4 mb-xl-0 mb-4">
            <a href="#">
                <div class="card">
                    <div class="card-header p-3 pt-2" style="border-radius: 0;">
                        <div
                            class="icon icon-lg icon-shape bg-gradient-primary shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                            <i class="fas fa-history opacity-10"></i>
                        </div>
                        <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">Chronologies</p>
                            <h4 class="mb-0">
                                History
                            </h4>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-4 col-sm-4 mb-xl-0 mb-4">
            @if ($customer = Customer::Find($deadline->customer_id))
                <a href="{{ route('UserEditCustomer', $customer->slug) }}">
                @else
                    <a href="#">
            @endif
            <div class="card">
                <div class="card-header p-3 pt-2" style="border-radius: 0;">
                    <div
                        class="icon icon-lg icon-shape bg-gradient-primary shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                        <i class="fas fa-edit opacity-10"></i>
                    </div>
                    <div class="text-end pt-1">
                        <p class="text-sm mb-0 text-capitalize">Edit</p>
                        <h4 class="mb-0">
                            Customer
                        </h4>
                    </div>
                </div>
            </div>
            </a>
        </div>
        <div class="col-xl-4 col-sm-4 mb-xl-0 mb-4">
            <a href="{{ route('UserAddDeadline') }}">
                <div class="card">
                    <div class="card-header p-3 pt-2" style="border-radius: 0;">
                        <div
                            class="icon icon-lg icon-shape bg-gradient-primary shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                            <i class="fas fa-plus opacity-10"></i>
                        </div>
                        <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">Add New</p>
                            <h4 class="mb-0">
                                Deadline
                            </h4>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-12">
            <div class="card my-4">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                        <h6 class="text-white text-capitalize ps-3">
                            Update Deadline
                        </h6>
                    </div>
                </div>
                <div class="card-body px-0 pb-2">
                    <div class="container">
                        <form>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="input-group input-group-static my-3">
                                        <label for="name">Name</label>
                                        <input type="text" wire:model.defer='name' value="{{ old('name') }}"
                                            class="form-control  @error('name') is-invalid @enderror"
                                            placeholder="Enter Name">
                                        @error('name')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group input-group-static my-3">
                                        <label for="select_customer">Select Customer</label>
                                        <select wire:model.defer='customer_id'
                                            class="form-control  @error('customer_id') is-invalid @enderror">
                                            <option value="">Select Customer</option>
                                            @if (User::CountCustomers(Auth::user()->id) > 0)
                                                @foreach (User::Customers(Auth::user()->id)->get() as $customer)
                                                    <option value="{{ $customer->id }}">{{ $customer->name }}
                                                    </option>
                                                @endforeach
                                            @else
                                                <option value="">No customer found</option>
                                            @endif
                                        </select>
                                        @error('customer_id')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group input-group-static my-3">
                                        <label for="date">Date</label>
                                        <input type="date" wire:model.defer='date' value="{{ old('date') }}"
                                            class="form-control  @error('date') is-invalid @enderror"
                                            placeholder="Enter Date">
                                        @error('date')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group input-group-static my-3">
                                        <label for="amount">Amount
                                            ({{ strtoupper(User::Currency(Auth::user()->id)) }})</label>
                                        <input type="text" wire:model.defer='amount' value="{{ old('amount') }}"
                                            class="form-control  @error('amount') is-invalid @enderror"
                                            placeholder="Enter Amount {{ strtoupper(User::Currency(Auth::user()->id)) }}">
                                        @error('amount')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group input-group-static my-3">
                                        <label for="renew_state">Renew State</label>
                                        <select wire:model.defer='renew_state'
                                            class="form-control  @error('renew_state') is-invalid @enderror">
                                            <option value="">Pick One</option>
                                            <option value="to_renew">To Renew</option>
                                            <option value="waiting_cash">Waiting Cash</option>
                                            <option value="renewed">Renewed</option>
                                            <option value="deleted">Deleted</option>
                                        </select>
                                        @error('renew_state')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="input-group input-group-static my-3">
                                        <label for="type_of_renew">Type Of Renew</label>
                                        <select wire:model.defer='type_of_renew'
                                            class="form-control  @error('type_of_renew') is-invalid @enderror">
                                            <option value="">Pick One</option>
                                            <option value="domain">Domain</option>
                                            <option value="hosting">Hosting</option>
                                            <option value="hosting_email">Hosting Email</option>
                                            <option value="wpml">Wpml</option>
                                            <option value="privacy_cookie">Privacy Cookie</option>
                                            <option value="other">Other</option>
                                        </select>
                                        @error('type_of_renew')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="input-group input-group-static my-3">
                                        <label for="note">Note</label>
                                        <textarea wire:model.defer='note' class="form-control  @error('note') is-invalid @enderror" placeholder="Enter Note"
                                            rows="5">{{ old('note') }}</textarea>
                                        @error('note')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="input-group input-group-static my-3">
                                        <label for="reminder">Reminder</label>
                                        <select wire:model.defer='reminder'
                                            class="form-control  @error('reminder') is-invalid @enderror">
                                            <option value="">Pick One</option>
                                            <option value="30_days_before">Send reminder for this deadline 30 days
                                                before</option>
                                            <option value="60_days_before">Send reminder for this deadline 60 days
                                                before</option>
                                        </select>
                                        @error('reminder')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button type="button" class="btn btn-primary" wire:attr='disabled'
                                        wire:click='Update'>
                                        <span wire:loading class="spinner-border spinner-border-sm" role="status"
                                            aria-hidden="true">
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
