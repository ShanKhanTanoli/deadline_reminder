<div class="col-lg-3">
    <div class="card position-sticky">
        <ul class="nav flex-column bg-white border-radius-lg p-3">
            <li wire:ignore.self
                class="nav-item @if (Request::path() == 'User/Settings/BusinessDetails') active bg-gradient-primary @else @endif">
                <a wire:ignore.self
                    class="nav-link text-dark d-flex @if (Request::path() == 'User/Settings/BusinessDetails') active text-white @else @endif"
                    href="{{ route('UserEditBusinessDetails') }}">
                    <i class="fas fa-info-circle me-2"></i>
                    <span class="text-sm">Business Details</span>
                </a>
            </li>
            <li wire:ignore.self
                class="nav-item @if (Request::path() == 'User/Settings/Profile') active bg-gradient-primary @else @endif">
                <a wire:ignore.self
                    class="nav-link text-dark d-flex @if (Request::path() == 'User/Settings/Profile') active text-white @else @endif"
                    href="{{ route('UserEditProfile') }}">
                    <i class="fas fa-user-edit me-2"></i>
                    <span class="text-sm">Profile</span>
                </a>
            </li>
            <li wire:ignore.self
                class="nav-item @if (Request::path() == 'User/Settings/Password') active bg-gradient-primary @else @endif">
                <a wire:ignore.self
                    class="nav-link text-dark d-flex @if (Request::path() == 'User/Settings/Password') active text-white @else @endif"
                    href="{{ route('UserEditPassword') }}">
                    <i class="fas fa-lock me-2"></i>
                    <span class="text-sm">Password</span>
                </a>
            </li>
        </ul>
    </div>
</div>
