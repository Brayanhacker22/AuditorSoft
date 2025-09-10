<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('solicitudes_rol', function (Blueprint $table) {
            $table->id('id_solicitud');
            $table->string('numero_documento', 79);
            $table->string('email', 200);
            $table->string('id_rol_solicitado', 10);
            $table->text('motivo')->nullable();
            $table->datetime('fecha_solicitud')->nullable();
            $table->enum('estado', ['enviada', 'aceptada', 'rechazada'])->default('enviada');
            $table->datetime('fecha_respuesta')->nullable();
            $table->string('admin_respuesta', 79)->nullable();
            $table->text('observaciones_admin')->nullable();

            $table->foreign('numero_documento')
                  ->references('numero_documento')
                  ->on('usuario');

            $table->foreign('id_rol_solicitado')
                  ->references('id_rol')
                  ->on('roles_app');

            $table->foreign('admin_respuesta')
                  ->references('numero_documento')
                  ->on('usuario');
        });
    }

    public function down()
    {
        Schema::dropIfExists('solicitudes_rol');
    }
};
