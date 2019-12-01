# frozen_string_literal: true

module Services
  class Venta
    def totalizar_y_cerrar(venta)
      totalizar(venta)
      venta.cambiar_estado(Venta::Statuses[:cerrado])
    end

    def totalizar(venta, con_reserva = false)
      subtotal = 0
      loop_over = con_reserva ? venta.vendible_ventas : venta.articulos
      loop_over.each do |vendible|
        subtotal +=  valor_vendible_segun_tipo(vendible)
      end
      venta.total = subtotal
      venta.save!
    end

    def subtotal_vendible_de_reserva(vendible)
      vendible.adelanto + vendible.calcular_total
    end

    def valor_vendible_segun_tipo(vendible)
      if vendible_type != "reserva"
        vendible.subtotal
      else
        subtotal_vendible_de_reserva(vendible)
      end
    end
  end
end
