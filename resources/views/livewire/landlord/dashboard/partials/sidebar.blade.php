<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 fixed-start bg-gradient-dark" id="sidenav-main">
    <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
            aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href="{{ route('LandlordDashboard') }}">
            <i class="fas fa-tachometer-alt text-white"></i>
            <span class="ms-1 font-weight-bold text-white">
                {{ Setting::Logo() }}
            </span>
        </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto h-100" id="sidenav-collapse-main">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Landlord/Dashboard') ? active bg-green : '' @endif"
                    href="{{ route('LandlordDashboard') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-tachometer-alt"></i>
                    </div>
                    <span class="nav-link-text ms-1">
                        Dashboard
                    </span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">
                    Properties
                </h6>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Landlord/Properties') ? active bg-green : '' @endif" href="#">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-city"></i>
                    </div>
                    <span class="nav-link-text ms-1">Properties</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Landlord/AddProperty') ? active bg-green : '' @endif" href="#">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-plus"></i>
                    </div>
                    <span class="nav-link-text ms-1">
                        Add
                    </span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">
                    Leases
                </h6>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Landlord/Leases') ? active bg-green : '' @endif" href="#">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-file-signature"></i>
                    </div>
                    <span class="nav-link-text ms-1">Leases</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Landlord/AddProperty') ? active bg-green : '' @endif" href="#">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-plus"></i>
                    </div>
                    <span class="nav-link-text ms-1">
                        Add
                    </span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">
                    Payments
                </h6>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Landlord/Payments') ? active bg-green : '' @endif" href="#">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-credit-card"></i>
                    </div>
                    <span class="nav-link-text ms-1">Payments</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Landlord/AddPayment') ? active bg-green : '' @endif" href="#">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-plus"></i>
                    </div>
                    <span class="nav-link-text ms-1">
                        Add
                    </span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">
                    Invoices
                </h6>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Landlord/Invoices') ? active bg-green : '' @endif" href="#">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-receipt"></i>
                    </div>
                    <span class="nav-link-text ms-1">Invoices</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Landlord/Invoice') ? active bg-green : '' @endif" href="#">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-plus"></i>
                    </div>
                    <span class="nav-link-text ms-1">
                        Add
                    </span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">
                    Notices
                </h6>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Landlord/VacateNotices') ? active bg-green : '' @endif" href="#">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-comment-alt"></i>
                    </div>
                    <span class="nav-link-text ms-1">Vacate Notices</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Landlord/VacateNotice') ? active bg-green : '' @endif" href="#">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-plus"></i>
                    </div>
                    <span class="nav-link-text ms-1">
                        Add
                    </span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">Account pages</h6>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Landlord/EditProfile') ? active bg-green : '' @endif"
                    href="{{ route('LandlordEditProfile') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-user-cog"></i>
                    </div>
                    <span class="nav-link-text ms-1">Profile</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Landlord/EditPassword') ? active bg-green : '' @endif"
                    href="{{ route('LandlordEditPassword') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <span class="nav-link-text ms-1">Password</span>
                </a>
            </li>
            <!--Begin::Logout-->
            @livewire('auth.logout')
            <!--Begin::Logout-->
        </ul>
    </div>
</aside>
