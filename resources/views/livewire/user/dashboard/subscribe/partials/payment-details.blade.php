<div class="card my-4">
    <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
        <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
            <h6 class="text-white text-capitalize ps-3">
                Payment details
            </h6>
        </div>
    </div>
    <div class="card-body px-0 pb-2">
        <div class="container">
            <form wire:submit.prevent='PayNow' id="subscribe-form">
                <div class="row">
                    <div class="col-md-6">
                        <div class="input-group input-group-static my-3">
                            <label for="card_holder_name">Card Holder Name</label>
                            <input id="card-holder-name" type="text" wire:model.defer='card_holder_name'
                                value="{{ old('card_holder_name') }}"
                                class="form-control  @error('card_holder_name') is-invalid @enderror"
                                placeholder="Card Holder Name">
                            @error('card_holder_name')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group input-group-static my-3">
                            <label for="card_number">Card Number</label>
                            <input id="card-number" type="text" wire:model.defer='card_number'
                                value="{{ old('card_number') }}"
                                class="form-control  @error('card_number') is-invalid @enderror"
                                placeholder="Card Number">
                            @error('card_number')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group input-group-static my-3">
                            <label for="card_expiry">Card Expiry</label>
                            <input id="card-expiry" type="month" wire:model.defer='card_expiry'
                                value="{{ old('card_expiry') }}"
                                class="form-control  @error('card_expiry') is-invalid @enderror"
                                placeholder="Card Expiry">
                            @error('card_expiry')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="input-group input-group-static my-3">
                            <label for="card_cvc">Card CVC</label>
                            <input id="card-cvc" type="text" wire:model.defer='card_cvc'
                                value="{{ old('card_cvc') }}"
                                class="form-control  @error('card_cvc') is-invalid @enderror"
                                placeholder="Card CVC">
                            @error('card_cvc')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>
                    <div class="col-md-12">
                        <button id="card-button" style="width:100%;"
                            type="submit" class="btn btn-block btn-primary" wire:attr='disabled'>
                            <span wire:loading class="spinner-border spinner-border-sm" role="status"
                                aria-hidden="true">
                            </span>
                            <i class="fab fa-stripe-cc"></i>
                            Pay Now
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
