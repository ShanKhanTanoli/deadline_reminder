<div class="container-fluid">
    @include('errors.alerts')
    <div class="row mb-4">
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <a href="{{ route('UserDeadlines') }}">
                <div class="card">
                    <div class="card-header p-3 pt-2" style="border-radius: 0;">
                        <div
                            class="icon icon-lg icon-shape bg-gradient-primary shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                            <i class="fas fa-calendar-alt opacity-10"></i>
                        </div>
                        <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">Deadlines</p>
                            <h4 class="mb-0">
                                {{ User::CountDeadlines(Auth::user()->id) }}
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
    <div class="row mt-4">
        <div class="col-12">
            <div class="card my-4">
                <div class="card-header p-0 position-relative mt-n4 mx-3 z-index-2">
                    <div class="bg-gradient-primary shadow-primary border-radius-lg pt-4 pb-3">
                        <h6 class="text-white text-capitalize ps-3">
                            Deadlines
                        </h6>
                    </div>
                </div>
                <div class="card-body px-0 pb-2">
                    <div class="table-responsive p-0">
                        <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
                            <div class="dataTable-top">
                                <div class="dataTable-dropdown">
                                    <label>
                                        <select wire:model="renewal_state" class="dataTable-selector">
                                            <option value="">Pick One</option>
                                            <option value="to_renew">To Renew</option>
                                            <option value="waiting_cash">Waiting Cash</option>
                                            <option value="renewed">Renewed</option>
                                            <option value="deleted">Deleted</option>
                                        </select>
                                        Renewal State
                                    </label>
                                </div>
                                <div class="dataTable-dropdown" style="margin-left:40px;">
                                    <label>
                                        <select wire:model="renewal_type" class="dataTable-selector">
                                            <option value="">Pick One</option>
                                            <option value="domain">Domain</option>
                                            <option value="hosting">Hosting</option>
                                            <option value="hosting_email">Hosting Email</option>
                                            <option value="wpml">WPML</option>
                                            <option value="privacy_cookie">Privacy Cookie</option>
                                            <option value="other">Other</option>
                                        </select>
                                        Renewal Type
                                    </label>
                                </div>
                                <div class="dataTable-search">
                                    <input wire:model.debounce.500ms="search" class="dataTable-input"
                                        placeholder="Search..." type="text">
                                </div>
                            </div>
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
                                            Customer
                                        </th>
                                        <th
                                            class="text-uppercase text-center text-secondary text-xxs font-weight-bolder opacity-7">
                                            Chronologies
                                        </th>
                                        {{-- <th
                                            class="text-uppercase text-center text-secondary text-xxs font-weight-bolder opacity-7">
                                            Edit
                                        </th> --}}
                                        <th
                                            class="text-uppercase text-center text-secondary text-xxs font-weight-bolder opacity-7">
                                            Delete
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($deadlines as $deadline)
                                        <tr>
                                            <td>
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">
                                                            {{ Str::substr($deadline->name, 0, 10) }}...
                                                        </h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">
                                                            {{ date('d M Y', strtotime($deadline->date)) }}
                                                        </h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">
                                                            {{ $deadline->amount }}
                                                            {{ strtoupper(User::Currency(Auth::user()->id)) }}
                                                        </h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
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
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
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
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="d-flex px-2 py-1">
                                                    <div class="d-flex flex-column justify-content-center">
                                                        <h6 class="mb-0 text-sm">
                                                            {{ Str::substr($deadline->note, 0, 10) }}...
                                                        </h6>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="text-center">
                                                @if ($customer = Customer::Find($deadline->customer_id))
                                                    <button class="btn btn-link mt-3"
                                                        wire:click='ViewCustomer("{{ $deadline->customer_id }}")'>
                                                        <span wire:loading
                                                            wire:target='ViewCustomer("{{ $deadline->customer_id }}")'
                                                            class="spinner-border spinner-border-sm" role="status"
                                                            aria-hidden="true"></span>
                                                        {{ Str::substr($customer->name, 0, 12) }}...
                                                    </button>
                                                @else
                                                    <span class="badge bg-gradient-danger">
                                                        Not Found
                                                    </span>
                                                @endif
                                            </td>
                                            <td class="text-center">
                                                <button class="btn btn-sm btn-primary"
                                                    wire:click='ViewChronologies("{{ $deadline->id }}")'>
                                                    <span wire:loading
                                                        wire:target='ViewChronologies("{{ $deadline->id }}")'
                                                        class="spinner-border spinner-border-sm" role="status"
                                                        aria-hidden="true"></span>
                                                    View Details
                                                </button>
                                            </td>
                                            {{-- <td class="text-center">
                                                <button class="btn btn-sm btn-primary"
                                                    wire:click='Edit("{{ $deadline->id }}")'>
                                                    <span wire:loading
                                                        wire:target='Edit("{{ $deadline->id }}")'
                                                        class="spinner-border spinner-border-sm" role="status"
                                                        aria-hidden="true"></span>
                                                    Edit
                                                </button>
                                            </td> --}}
                                            <td class="text-center">
                                                <button class="btn"
                                                    wire:click='deleteconfirm("{{ $deadline->id }}")'>
                                                    <span wire:loading
                                                        wire:target='deleteconfirm("{{ $deadline->id }}")'
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
                </div>
                @if (Auth::user()->deadlines->count() > $deadlines->count())
                    <div class="card-footer text-center">
                        <button type="button" class="btn btn-primary btn-sm" wire:attr='disabled'
                            wire:click='loadMore'>
                            <span wire:loading wire:target='loadMore' class="spinner-border spinner-border-sm" role="status"
                                aria-hidden="true">
                            </span>
                            Load More
                        </button>
                    </div>
                @endif
            </div>
        </div>
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
                                Are you sure you want to delete the Deadline <span
                                    class="text-danger">{{ $delete->name }}</span> and all the chronologies associated
                                with this deadline? the operation is not reversible.
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
