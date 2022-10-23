<div class="container-fluid my-3 py-3">
    <!--Begin::Alerts-->
    @include('errors.alerts')
    <!--End::Alerts-->
    <div class="row mb-5">
        <!--Begin::Sidebar-->
        @include('livewire.user.dashboard.settings.partials.sidebar')
        <!--Begin::Sidebar-->
        <div class="col-lg-9 mt-lg-0 mt-4">
            <div class="row">
                <div class="col-12">
                    <div class="card" style="z-index:0;">
                        <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                            <div class="bg-primary shadow-primary border-radius-lg pt-4 pb-3">
                                <h6 class="text-white text-capitalize ps-3">
                                    Configure Your Mail
                                </h6>
                            </div>
                        </div>
                        <div class="card-body px-0 pb-2">
                            <div class="container">
                                <!--Begin::Info tag-->
                                <div class="alert alert-info text-white fade show" role="alert">
                                    <span class="alert-icon align-middle">
                                      <i class="fas fa-info-circle"></i>
                                    </span>
                                    <span class="alert-text text-white">
                                        Please use these keywords
                                        (
                                        <code class="text-white">customer_name</code> ,
                                        <code class="text-white">type_of_renew</code> ,
                                        <code class="text-white">renew_state</code> ,
                                        <code class="text-white">payment_date</code> ,
                                        <code class="text-white">payment_amount</code>
                                        )
                                        in the Email.
                                    </span>
                                </div>
                                <!--Begin::Info tag-->
                                <form wire:submit.prevent='Update'>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div wire:ignore class="input-group input-group-static my-3">
                                                <textarea id="email_template" wire:model.defer='email_template' name="email_template"
                                                    class="summernote form-control  @error('email_template') is-invalid @enderror" placeholder="Email Template">{{ old('email_template') }}</textarea>
                                            </div>
                                            <div class="mt-2 mb-2">
                                                @error('email_template')
                                                    <span class="invalid-feedback" style="display: block;" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-6">
                                            <button type="submit" class="btn btn-primary" wire:attr='disabled'>
                                                <span wire:target='Update' wire:loading
                                                    class="spinner-border spinner-border-sm" role="status"
                                                    aria-hidden="true"></span>
                                                Save Changes
                                            </button>
                                            <a target="_blank" href="{{ route('viewemail') }}" class="btn btn-info">
                                                View Template
                                            </a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @section('scripts')
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <style>
            .note-editor {
                width: 100%;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        <script>
            $(document).ready(function() {
                $('.summernote').summernote({
                    tabsize: 2,
                    height: 200,
                    toolbar: [
                        ['style', ['style']],
                        ['font', ['bold', 'underline', 'clear', 'italic']],
                        ['color', ['color']],
                        ['para', ['ul', 'ol', 'paragraph']],
                        ['table', ['table']],
                        // ['view', ['fullscreen', 'codeview', ]]
                    ],
                    callbacks: {
                        onChange: function(contents, $editable) {
                            @this.set('email_template', contents);
                        }
                    }
                });
            });
        </script>
    @endsection
</div>
