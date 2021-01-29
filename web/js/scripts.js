$(document).ready(function () {
    
    $("#registrarconductores").click(function () {
        event.preventDefault();
        if ($("#nombres").val() == "") {
            alert("falta llenar el nombre");
        } else {
            if ($("#apellidos").val() == "") {
                alert("falta llenar los apellidos");
            } else {
                if ($("#dni").val() == "") {
                    alert("falta llenar el dni");
                } else {
                    if ($("#nlicencia").val() == "") {
                        alert("falta llenar el numero de licencia");
                    } else {
                        if ($("#claselicencia").val() == "") {
                            alert("falta seleccionar la clase de licencia");
                        } else {
                            if ($("#categorialicencia").val() == "") {
                                alert("falta seleccionar la categoria");
                            } else {
                                $("#formularioconductores").submit();
                            }
                        }

                    }

                }

            }
        }

    })


    $("#registrarpolicias").click(function () {
        event.preventDefault();
        if ($("#nombres").val() == "") {
            alert("falta llenar el nombre");
        } else {
            if ($("#apellidos").val() == "") {
                alert("falta llenar los apellidos");
            } else {
                if ($("#dni").val() == "") {
                    alert("falta llenar el dni");
                } else {
                    if ($("#codcip").val() == "") {
                        alert("falta llenar su codigo cip");
                    } else {
                        $("#formulariopolicias").submit();

                    }

                }

            }
        }

    })
    
    $("#registrarcodmultas").click(function () {
        event.preventDefault();
        if ($("#codfalta").val() == "") {
            alert("falta llenar el codigo de la falta");
        } else {
            if ($("#descripcion").val() == "") {
                alert("falta llenar la descripción");
            } else {
                if ($("#clasificacion").val() == "") {
                    alert("falta seleccionar la clasificación");
                } else {
                    if ($("#montouit").val() == "") {
                        alert("falta llenar el monto de UIT");
                    } else {
                        if ($("#puntos").val() == "") {
                            alert("falta llenar los puntos");
                        } else {
                            if ($("#sancion").val() == "") {
                                alert("falta llenar la sanción");
                            } else {
                                $("#formulariocodmultas").submit();
                            }

                        }
                    }


                }

            }
        }

    })
    $("#registrarlistamultas").click(function () {
        event.preventDefault();
        if ($("#dni").val() == "") {
            alert("falta ingresar el DNI");
        } else {
            if ($("#cip").val() == "") {
                alert("falta ingresar el CIP");
            } else {
                if ($("#multa").val() == "") {
                    alert("falta ingresar el codigo de la multa");
                } else {
                    if ($("#fecha").val() == "") {
                        alert("falta ingresar la fecha");
                    } else {
                        if ($("#placa").val() == "") {
                            alert("falta ingresar la placa");
                        } else {
                            if ($("#lugar").val() == "") {
                            alert("falta ingresar el lugar");
                            } else {
                                if ($("#ubicacion").val() == "") {
                                    alert("falta ingresar la ubicación");
                                } else {
                                    if ($("#observacionesconductor").val() == "") {
                                        alert("falta llenar las observaciones del conductor");
                                    } else {
                                        if ($("#observacionespolicias").val() == "") {
                                            alert("falta llenar las observaciones del policía");
                                        } else {
                                            $("#formulariomultas").submit();
                                        }

                                    }

                                }


                            }


                        }
                    }


                }

            }
        }

    })

    $("#registrarmismultas").click(function () {
        event.preventDefault();
        if ($("#dni").val() == "") {
            alert("Escriba su DNI");
        } 
        else {
                        $("#formulariomismultas").submit();

                    }
        
    })
})