<div class="container-fluid">
    @include('errors.alerts')
    <div class="row">
        <div class="col-12">
            <div class="card my-4">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                        <h6 class="text-white text-capitalize ps-3">
                            Add Customer
                        </h6>
                    </div>
                </div>
                <div class="card-body px-0 pb-2">
                    <div class="container">
                        @if (Auth::user()->subscriptions()->active()->count() > 0)
                            <form wire:submit.prevent='Add'>
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
                                            <textarea wire:model.defer='note' class="form-control  @error('note') is-invalid @enderror"
                                                placeholder="Enter Note">{{ old('note') }}</textarea>
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
                        @else
                            <!--Begin::Not any active subscription-->
                            <div class="alert alert-info text-center text-white">
                                <strong>
                                    You don't have any active subscription.
                                </strong>
                            </div>
                            <!--End::Not any active subscription-->
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
