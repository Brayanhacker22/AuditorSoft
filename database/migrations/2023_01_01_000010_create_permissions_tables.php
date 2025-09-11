<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('permissions', function (Blueprint $table) {
            $table->id();
            $table->enum('type', ['admin', 'user']);
            $table->string('guard_name');
            $table->string('name');
            $table->string('description')->nullable();
            $table->unsignedBigInteger('parent_id')->nullable();
            $table->tinyInteger('sort')->default(1);
            $table->timestamps();

            $table->foreign('parent_id')
                  ->references('id')
                  ->on('permissions')
                  ->onDelete('cascade');
        });

        Schema::create('model_has_permissions', function (Blueprint $table) {
            $table->unsignedBigInteger('permission_id');
            $table->string('model_type');
            $table->unsignedBigInteger('model_id');

            $table->primary(['permission_id', 'model_id', 'model_type']);
            $table->index(['model_id', 'model_type']);

            $table->foreign('permission_id')
                  ->references('id')
                  ->on('permissions')
                  ->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('model_has_permissions');
        Schema::dropIfExists('permissions');
    }
};
