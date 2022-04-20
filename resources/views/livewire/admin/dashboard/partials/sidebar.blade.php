<aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 fixed-start   bg-gradient-dark" id="sidenav-main">
    <div class="sidenav-header">
        <i class="fas fa-times p-3 cursor-pointer text-white opacity-5 position-absolute end-0 top-0 d-none d-xl-none"
            aria-hidden="true" id="iconSidenav"></i>
        <a class="navbar-brand m-0" href="{{ route('AdminDashboard') }}">
            <span class="ms-1 font-weight-bold text-white">
                {{ Setting::Logo() }}
            </span>
        </a>
    </div>
    <hr class="horizontal light mt-0 mb-2">
    <div class="collapse navbar-collapse  w-auto h-100" id="sidenav-collapse-main">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Admin/Dashboard') ? active bg-green : '' @endif"
                    href="{{ route('AdminDashboard') }}">
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
                    Landlords
                </h6>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Admin/Landlords') ? active bg-green : '' @endif"
                    href="{{ route('AdminLandlords') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-users"></i>
                    </div>
                    <span class="nav-link-text ms-1">Landlords</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Admin/AddLandlord') ? active bg-green : '' @endif"
                    href="{{ route('AdminAddLandlord') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-plus"></i>
                    </div>
                    <span class="nav-link-text ms-1">Add Landlord</span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">
                    Tenants
                </h6>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Admin/Tenants') ? active bg-green : '' @endif"
                    href="{{ route('AdminTenants') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-users"></i>
                    </div>
                    <span class="nav-link-text ms-1">Tenants</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Admin/AddTenant') ? active bg-green : '' @endif"
                    href="{{ route('AdminAddTenant') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-plus"></i>
                    </div>
                    <span class="nav-link-text ms-1">Add Tenant</span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">
                    Properties
                </h6>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Admin/Properties') ? active bg-green : '' @endif" href="#">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-city"></i>
                    </div>
                    <span class="nav-link-text ms-1">Properties</span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">
                    Contractors
                </h6>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Admin/Contractors') ? active bg-green : '' @endif"
                    href="{{ route('AdminContractors') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-file-signature"></i>
                    </div>
                    <span class="nav-link-text ms-1">Contractors</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Admin/AddContractor') ? active bg-green : '' @endif"
                    href="{{ route('AdminAddContractor') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-plus"></i>
                    </div>
                    <span class="nav-link-text ms-1">Add Contractor</span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">
                    Account Settings
                </h6>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Admin/EditProfile') ? active bg-green : '' @endif"
                    href="{{ route('AdminEditProfile') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-user-cog"></i>
                    </div>
                    <span class="nav-link-text ms-1">Profile</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Admin/EditPassword') ? active bg-green : '' @endif"
                    href="{{ route('AdminEditPassword') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <span class="nav-link-text ms-1">Password</span>
                </a>
            </li>
            <li class="nav-item mt-3">
                <h6 class="ps-4 ms-2 text-uppercase text-xs text-white font-weight-bolder opacity-8">
                    Website Settings
                </h6>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white @if (Request::path() == 'Admin/Settings') ? active bg-green : '' @endif"
                    href="{{ route('AdminSettings') }}">
                    <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-cogs"></i>
                    </div>
                    <span class="nav-link-text ms-1">Settings</span>
                </a>
            </li>
            <!--Begin::Logout-->
            @livewire('auth.logout')
            <!--Begin::Logout-->
        </ul>
    </div>
</aside>
