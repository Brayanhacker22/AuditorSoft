<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->enum('type', ['admin', 'user'])->default('user');
            $table->timestamp('password_changed_at')->nullable();
            $table->tinyInteger('active')->unsigned()->default(1);
            $table->string('timezone')->nullable();
            $table->timestamp('last_login_at')->nullable();
            $table->string('last_login_ip')->nullable();
            $table->tinyInteger('to_be_logged_out')->default(0);
            $table->string('provider')->nullable();
            $table->string('provider_id')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn([
                'type',
                'password_changed_at',
                'active',
                'timezone',
                'last_login_at',
                'last_login_ip',
                'to_be_logged_out',
                'provider',
                'provider_id',
                'deleted_at'
            ]);
        });
    }
};
