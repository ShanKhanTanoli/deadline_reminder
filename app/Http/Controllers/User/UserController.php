<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class UserController extends Controller
{

    //Save Email Template
    public function UserSaveEmailTemplate(Request $request)
    {
        $msg = [
            'mail_template.required' => 'Email template can not be empty',
        ];
        $validated = $request->validate([
            'mail_template' => 'required|string',
        ], $msg);

        dd($validated);
    }
}
