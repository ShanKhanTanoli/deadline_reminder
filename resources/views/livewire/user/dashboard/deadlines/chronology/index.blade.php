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
                                    <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">
                                        Customer
                                    </th>
                                    <th
                                        class="text-uppercase text-center text-secondary text-xxs font-weight-bolder opacity-7">
                                        View Customer
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
                                                        <span class="badge bg-gradient-primary">
                                                            To Renew
                                                        </span>
                                                    @endif
                                                    @if ($chronology->renew_state == 'waiting_cash')
                                                        <span class="badge bg-gradient-primary">
                                                            Waiting Cash
                                                        </span>
                                                    @endif
                                                    @if ($chronology->renew_state == 'renewed')
                                                        <span class="badge bg-gradient-success">
                                                            Renewed
                                                        </span>
                                                    @endif
                                                    @if ($chronology->renew_state == 'deleted')
                                                        <span class="badge bg-gradient-danger">
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
                                                        <span class="badge bg-gradient-primary">
                                                            Domain
                                                        </span>
                                                    @endif
                                                    @if ($chronology->type_of_renew == 'hosting')
                                                        <span class="badge bg-gradient-primary">
                                                            Hosting
                                                        </span>
                                                    @endif
                                                    @if ($chronology->type_of_renew == 'hosting_email')
                                                        <span class="badge bg-gradient-primary">
                                                            Hosting Email
                                                        </span>
                                                    @endif
                                                    @if ($chronology->type_of_renew == 'wpml')
                                                        <span class="badge bg-gradient-primary">
                                                            wpml
                                                        </span>
                                                    @endif
                                                    @if ($chronology->type_of_renew == 'privacy_cookie')
                                                        <span class="badge bg-gradient-primary">
                                                            Privacy Cookie
                                                        </span>
                                                    @endif
                                                    @if ($chronology->type_of_renew == 'other')
                                                        <span class="badge bg-gradient-dark">
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
                                                        {{ Str::substr($chronology->note, 0, 12) }}...
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <div class="d-flex px-2 py-1">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <h6 class="mb-0 text-sm">
                                                        @if ($customer = Customer::Find($chronology->customer_id))
                                                            @if (strlen($customer->name) > 10)
                                                                {{ $customer->name }}...
                                                            @else
                                                                {{ $customer->name }}
                                                            @endif
                                                        @else
                                                            {{ __('DELETED') }}
                                                        @endif
                                                    </h6>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <button class="btn btn-sm btn-info"
                                                wire:click='ViewCustomer("{{ $chronology->customer_id }}")'>
                                                <span wire:loading
                                                    wire:target='ViewCustomer("{{ $chronology->customer_id }}")'
                                                    class="spinner-border spinner-border-sm" role="status"
                                                    aria-hidden="true"></span>
                                                View
                                            </button>
                                        </td>
                                        <td class="text-center">
                                            <button class="btn btn-sm btn-danger"
                                                wire:click='Delete("{{ $chronology->id }}")'>
                                                <span wire:loading wire:target='Delete("{{ $chronology->id }}")'
                                                    class="spinner-border spinner-border-sm" role="status"
                                                    aria-hidden="true"></span>
                                                Delete
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
</div>
