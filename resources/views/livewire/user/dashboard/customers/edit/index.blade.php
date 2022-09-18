<div class="container-fluid">
    @include('errors.alerts')
    <div class="row mb-2">
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <a href="{{ route('UserViewCustomerDeadlines', $customer->slug) }}">
                <div class="card">
                    <div class="card-header p-3 pt-2" style="border-radius: 0;">
                        <div
                            class="icon icon-lg icon-shape bg-gradient-primary shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                            <i class="fas fa-calendar-alt opacity-10"></i>
                        </div>
                        <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">Deadlines</p>
                            <h4 class="mb-0">
                                {{ Customer::CountDeadlines($customer->id) }}
                            </h4>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
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
    <div class="row mt-2">
        <div class="col-12 mt-4">
            <div class="card my-4">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                        <h6 class="text-white text-capitalize ps-3">
                            Update Customer
                        </h6>
                    </div>
                </div>
                <div class="card-body px-0 pb-2">
                    <div class="container">
                        <form wire:submit.prevent='Update'>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="input-group input-group-static my-3">
                                        <label for="name">Contact Details</label>
                                        <input type="text" wire:model.defer='name' value="{{ old('name') }}"
                                            class="form-control  @error('name') is-invalid @enderror"
                                            placeholder="Enter Contact Details">
                                        @error('name')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group input-group-static my-3">
                                        <label for="number">Phone Number</label>
                                        <input type="number" wire:model.defer='number' value="{{ old('number') }}"
                                            class="form-control  @error('number') is-invalid @enderror"
                                            placeholder="Enter Phone Number">
                                        @error('number')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group input-group-static my-3">
                                        <label for="email">Email</label>
                                        <input type="email" wire:model.defer='email' value="{{ old('email') }}"
                                            class="form-control  @error('email') is-invalid @enderror"
                                            placeholder="Enter Email">
                                        @error('email')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="input-group input-group-static my-3">
                                        <label for="address">Address</label>
                                        <textarea wire:model.defer='address' class="form-control  @error('address') is-invalid @enderror"
                                            placeholder="Enter Address">{{ old('address') }}</textarea>
                                        @error('address')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="input-group input-group-static my-3">
                                        <label for="note">Note</label>
                                        <textarea wire:model.defer='note' class="form-control  @error('note') is-invalid @enderror" placeholder="Enter Note">{{ old('note') }}</textarea>
                                        @error('note')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" class="btn btn-primary" wire:attr='disabled'>
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
