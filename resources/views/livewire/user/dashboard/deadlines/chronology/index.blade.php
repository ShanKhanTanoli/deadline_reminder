<div class="container-fluid">
    @include('errors.alerts')
    <div class="row mb-4">
        <div class="col-xl-4 col-sm-4 mb-xl-0 mb-4">
            <a href="{{ route('UserDeadlines') }}">
                <div class="card">
                    <div class="card-header p-3 pt-2" style="border-radius: 0;">
                        <div
                            class="icon icon-lg icon-shape bg-gradient-primary shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                            <i class="fas fa-arrow-left opacity-10"></i>
                        </div>
                        <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">Go</p>
                            <h4 class="mb-0">
                                Back
                            </h4>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-4 col-sm-4 mb-xl-0 mb-4">
            <a href="{{ route('UserDeadlines') }}">
                <div class="card">
                    <div class="card-header p-3 pt-2" style="border-radius: 0;">
                        <div
                            class="icon icon-lg icon-shape bg-gradient-primary shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                            <i class="fas fa-calendar-alt opacity-10"></i>
                        </div>
                        <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">View Deadlines</p>
                            <h4 class="mb-0">
                                {{ User::CountDeadlines(Auth::user()->id) }}
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
    <div class="row mt-4">
        <div class="col-12">
            <div class="card my-4">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                        <h6 class="text-white text-capitalize ps-3">
                            {{ $deadline->name }} Chronologies
                        </h6>
                    </div>
                </div>
                <div class="card-body px-0 pb-2">
                    <div class="table-responsive p-0">
                        <table class="table align-items-center mb-0">
                            <thead>
                                <tr>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Name
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Date
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Amount
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Renew State
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Renew Type
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Note
                                    </th>
                                    <th
                                        class="text-uppercase text-center text-secondary text-xxs font-weight-bolder opacity-7">
                                        Delete
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($chronologies as $chronology)
                                    <tr>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        {{ $chronology->name }}
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        {{ date('d M Y', strtotime($chronology->created_at)) }}
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        {{ $chronology->amount }}
                                                        {{ strtoupper(User::Currency(Auth::user()->id)) }}
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    @if ($chronology->renew_state == 'to_renew')
                                                        <span class="to_renew">
                                                            To Renew
                                                        </span>
                                                    @endif
                                                    @if ($chronology->renew_state == 'waiting_cash')
                                                        <span class="waiting_cash">
                                                            Waiting Cash
                                                        </span>
                                                    @endif
                                                    @if ($chronology->renew_state == 'renewed')
                                                        <span class="renewed">
                                                            Renewed
                                                        </span>
                                                    @endif
                                                    @if ($chronology->renew_state == 'deleted')
                                                        <span class="deleted">
                                                            Deleted
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    @if ($chronology->type_of_renew == 'domain')
                                                        <span class="domain">
                                                            Domain
                                                        </span>
                                                    @endif
                                                    @if ($chronology->type_of_renew == 'hosting')
                                                        <span class="hosting">
                                                            Hosting
                                                        </span>
                                                    @endif
                                                    @if ($chronology->type_of_renew == 'hosting_email')
                                                        <span class="hosting_email">
                                                            Hosting Email
                                                        </span>
                                                    @endif
                                                    @if ($chronology->type_of_renew == 'wpml')
                                                        <span class="wpml">
                                                            wpml
                                                        </span>
                                                    @endif
                                                    @if ($chronology->type_of_renew == 'privacy_cookie')
                                                        <span class="privacy_cookie">
                                                            Privacy Cookie
                                                        </span>
                                                    @endif
                                                    @if ($chronology->type_of_renew == 'other')
                                                        <span class="other">
                                                            other
                                                        </span>
                                                    @endif
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        {{ Str::substr($chronology->note, 0, 15) }}...
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <button class="btn" wire:click='deleteconfirm("{{ $chronology->id }}")'>
                                                <span wire:loading wire:target='deleteconfirm("{{ $chronology->id }}")'
                                                    class="spinner-border spinner-border-sm" role="status"
                                                    aria-hidden="true"></span>
                                                <i class="fas fa-times text-danger"></i>
                                            </button>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer">
                    {{ $chronologies->render() }}
                </div>
            </div>
        </div>
    </div>
    <div class="row mt-4">
        <!--Begin::Deadline Details-->
        <div class="col-md-6 mb-4">
            <div class="card shadow-lg">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                        <h6 class="text-white text-capitalize ps-3">
                            Deadline Details
                        </h6>
                    </div>
                </div>
                <div class="card-body text-lg-start text-center mt-2">
                    <div class="d-flex justify-content-lg-start justify-content-center p-2">
                        <strong>Name : &nbsp; </strong>
                        <span class=""> {!! $deadline->name !!}</span>
                    </div>
                    <div class="d-flex justify-content-lg-start justify-content-center p-2">
                        <strong>Date : &nbsp; </strong>
                        <span class=""> {{ date('d M Y', strtotime($deadline->date)) }}</span>
                    </div>
                    <div class="d-flex justify-content-lg-start justify-content-center p-2">
                        <strong>Amount : &nbsp; </strong>
                        <span class=""> {{ $deadline->amount }}
                            {{ strtoupper(User::Currency(Auth::user()->id)) }}</span>
                    </div>
                    <div class="d-flex justify-content-lg-start justify-content-center p-2">
                        <strong>Renew State : &nbsp; </strong>
                        <span class="">
                            @if ($deadline->renew_state == 'to_renew')
                                <span class="to_renew">
                                    To Renew
                                </span>
                            @endif
                            @if ($deadline->renew_state == 'waiting_cash')
                                <span class="waiting_cash">
                                    Waiting Cash
                                </span>
                            @endif
                            @if ($deadline->renew_state == 'renewed')
                                <span class="renewed">
                                    Renewed
                                </span>
                            @endif
                            @if ($deadline->renew_state == 'deleted')
                                <span class="deleted">
                                    Deleted
                                </span>
                            @endif
                        </span>
                    </div>
                    <div class="d-flex justify-content-lg-start justify-content-center p-2">
                        <strong>Renew Type : &nbsp; </strong>
                        <span class="">
                            @if ($deadline->type_of_renew == 'domain')
                                <span class="domain">
                                    Domain
                                </span>
                            @endif
                            @if ($deadline->type_of_renew == 'hosting')
                                <span class="hosting">
                                    Hosting
                                </span>
                            @endif
                            @if ($deadline->type_of_renew == 'hosting_email')
                                <span class="hosting_email">
                                    Hosting Email
                                </span>
                            @endif
                            @if ($deadline->type_of_renew == 'wpml')
                                <span class="wpml">
                                    wpml
                                </span>
                            @endif
                            @if ($deadline->type_of_renew == 'privacy_cookie')
                                <span class="privacy_cookie">
                                    Privacy Cookie
                                </span>
                            @endif
                            @if ($deadline->type_of_renew == 'other')
                                <span class="other">
                                    other
                                </span>
                            @endif
                        </span>
                    </div>
                    <div class="d-flex justify-content-lg-start justify-content-center p-2">
                        <strong>Note : &nbsp; </strong>
                        <span class=""> {!! Str::substr($deadline->note, 0, 25) !!}</span>
                    </div>
                    <div class="d-flex justify-content-lg-start justify-content-center p-2">
                        <strong>Private Note : &nbsp; </strong>
                        <span class=""> {!! Str::substr($deadline->private_note, 0, 25) !!}</span>
                    </div>
                </div>
            </div>
        </div>
        <!--End::Deadline Details-->

        <!--Begin::Customer Details-->
        <div class="col-md-6 mb-4">
            <div class="card shadow-lg">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                        <h6 class="text-white text-capitalize ps-3">
                            Customer Details
                        </h6>
                    </div>
                </div>
                <div class="card-body text-lg-start text-center mt-2">
                    @if ($customer = Customer::Find($deadline->customer_id))
                        <div class="d-flex justify-content-lg-start justify-content-center p-2">
                            <strong>Name : &nbsp; </strong>
                            <span class=""> {{ Str::substr($customer->name, 0, 25) }}</span>
                        </div>
                        <div class="d-flex justify-content-lg-start justify-content-center p-2">
                            <strong>Email : &nbsp; </strong>
                            <span class=""> {{ Str::substr($customer->email, 0, 25) }}</span>
                        </div>
                        <div class="d-flex justify-content-lg-start justify-content-center p-2">
                            <strong>Number : &nbsp; </strong>
                            <span class=""> {{ Str::substr($customer->number, 0, 25) }}</span>
                        </div>
                        <div class="d-flex justify-content-lg-start justify-content-center p-2">
                            <strong>Address : &nbsp; </strong>
                            <span class=""> {{ Str::substr($customer->address, 0, 25) }}</span>
                        </div>
                        <div class="d-flex justify-content-lg-start justify-content-center p-2">
                            <strong>Note : &nbsp; </strong>
                            <span class=""> {{ Str::substr($customer->note, 0, 25) }}</span>
                        </div>
                    @else
                        <span class="badge bg-gradient-danger w-100 p-3">
                            <strong>
                                Not Found
                            </strong>
                        </span>
                    @endif
                </div>
            </div>
        </div>
        <!--End::Customer Details-->
    </div>
    @if ($delete)
        <!--Begin::Delete Modal-->
        <div wire:ignore.self class="modal fade" id="Delete" tabindex="-1" aria-labelledby="DeleteLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body text-center">
                        <h1 class="text-center mb-2">
                            <i class="fas fa-times text-danger" style="font-size: 50px;"></i>
                        </h1>
                        <h3 class="text-center">Delete Deadline</h3>
                        <p>
                            <strong>
                                Are you sure you want to delete this row of chronologies? the operation is not
                                reversible.
                            </strong>
                        </p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary btn-sm"
                            data-bs-dismiss="modal">Close</button>
                        <button wire:click="Delete('{{ $delete->id }}')" type="button"
                            class="btn btn-danger btn-sm">
                            {{ __('Delete') }}
                            <div wire:loading wire:target="Delete('{{ $delete->id }}')"
                                class="spinner-border spinner-border-sm" role="status">
                                <span class="visually-hidden">Loading...</span>
                            </div>
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!--End::Delete Modal-->
    @endif
    @section('scripts')
        <script>
            Livewire.on('delete', function() {
                $('#Delete').modal('show');
            })
        </script>
    @endsection
</div>
