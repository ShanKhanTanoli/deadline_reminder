<li class="nav-item">
    <button style="border:1px solid transparent; background:transparent;" button wire:click='logout()' type="button"
        class="nav-link text-white" href="{{ route('AdminSettings') }}">
        <span wire:loading class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
        <div class="text-white text-center me-2 d-flex align-items-center justify-content-center">
            <i class="fas fa-power-off"></i>
        </div>
        <span class="nav-link-text ms-1">Logout</span>
    </button>
</li>
