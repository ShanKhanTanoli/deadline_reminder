<div class="container-fluid">
    @include('errors.alerts')
    <div class="row mb-4">
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <a href="{{ route('UserCustomers') }}">
                <div class="card">
                    <div class="card-header p-3 pt-2" style="border-radius: 0;">
                        <div
                            class="icon icon-lg icon-shape bg-gradient-primary shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                            <i class="fas fa-users opacity-10"></i>
                        </div>
                        <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">Customers</p>
                            <h4 class="mb-0">
                                {{ User::CountCustomers(Auth::user()->id) }}
                            </h4>
                        </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-6 col-sm-6 mb-xl-0 mb-4">
            <a href="{{ route('UserAddCustomer') }}">
                <div class="card">
                    <div class="card-header p-3 pt-2" style="border-radius: 0;">
                        <div
                            class="icon icon-lg icon-shape bg-gradient-primary shadow-dark text-center border-radius-xl mt-n4 position-absolute">
                            <i class="fas fa-plus opacity-10"></i>
                        </div>
                        <div class="text-end pt-1">
                            <p class="text-sm mb-0 text-capitalize">Add New</p>
                            <h4 class="mb-0">
                                Customer
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
                            Customers
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
                                        Email
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Note
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                                        View Deadline
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                                        Edit
                                    </th>
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 text-center">
                                        Delete
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($customers as $customer)
                                    <tr>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        {{ $customer->name }}
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        {{ $customer->email }}
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        {{ Str::substr($customer->note, 0, 15) }}...
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="align-middle text-center">
                                            <button class="btn"
                                                wire:click='CustomerDeadlines("{{ $customer->id }}")'>
                                                <span wire:loading
                                                    wire:target='CustomerDeadlines("{{ $customer->id }}")'
                                                    class="spinner-border spinner-border-sm" role="status"
                                                    aria-hidden="true"></span>
                                                <i class="fas fa-eye text-info"></i>
                                            </button>
                                        </td>
                                        <td class="align-middle text-center">
                                            <button class="btn"
                                                wire:click='Edit("{{ $customer->id }}")'>
                                                <span wire:loading wire:target='Edit("{{ $customer->id }}")'
                                                    class="spinner-border spinner-border-sm" role="status"
                                                    aria-hidden="true"></span>
                                                <i class="fas fa-edit text-success"></i>
                                            </button>
                                        </td>
                                        <td class="align-middle text-center">
                                            <button class="btn"
                                                wire:click='deleteconfirm("{{ $customer->id }}")'>
                                                <span wire:loading wire:target='deleteconfirm("{{ $customer->id }}")'
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
                    {{ $customers->render() }}
                </div>
            </div>
        </div>
    </div>
    @if($delete)
        <!--Begin::Delete Modal-->
        <div wire:ignore.self class="modal fade" id="Delete" tabindex="-1" aria-labelledby="DeleteLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-center">
                    <h1 class="text-center mb-2">
                        <i class="fas fa-times text-danger" style="font-size: 50px;"></i>
                    </h1>
                    <h3 class="text-center">Delete Customer</h3>
                    <p>
                        <strong>
                            Are you sure you want to delete the <span class="text-danger">Customer {{ $delete->name }}</span> and all the deadlines associated with him? the operation is not reversible
                        </strong>
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Close</button>
                    <button wire:click="Delete('{{ $delete->id }}')" type="button" class="btn btn-danger btn-sm">
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
