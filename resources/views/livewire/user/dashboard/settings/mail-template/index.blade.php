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
                                <form method="POST" action="{{ route('UserSaveEmailTemplate') }}">
                                    @csrf
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="input-group input-group-static my-3">
                                                <textarea name="mail_template" class="summernote form-control  @error('mail_template') is-invalid @enderror"
                                                    placeholder="Email Template">{{ old('mail_template') }}</textarea>
                                                @error('mail_template')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                        <div class="col-md-6">
                                            <button type="submit" class="btn btn-primary">
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
                        ['view', ['fullscreen', 'codeview', ]]
                    ],
                    callbacks: {
                        onChange: function(contents, $editable) {
                            @this.set('description', contents);
                        }
                    }
                });
            });
        </script>
    @endsection
</div>
