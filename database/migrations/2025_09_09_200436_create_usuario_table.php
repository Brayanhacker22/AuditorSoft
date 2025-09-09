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
        Schema::create('usuario', function (Blueprint $table) {
            $table->string('numero_documento', 79)->primary();
            $table->string('tipo_doc', 100);
            $table->string('nombre_completo', 300)->nullable();
            $table->string('contraseña', 200)->nullable();
            $table->string('email', 200);
            $table->string('telefono', 50);
            $table->string('id_rol', 10);
            $table->foreign('id_rol')->references('id_rol')->on('roles_app');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('usuario');
    }
};
