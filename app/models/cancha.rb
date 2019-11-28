class Cancha < ApplicationRecord
  SECONDS_PER_HOUR = 3600
  belongs_to :creador, class_name: "Usuario"
  validates :nombre, length: { minimum: 3 }
  validates :precio_hora, numericality: { greater_than: 0 }
  validates :descripcion,
    length: { minimum: 10, maximum: 250 },
    if: :descripcion_present?

  store :condicion_extra1, coder: JSON
  store :condicion_extra2, coder: JSON

  def precio_con_condiciones(stamp_start, stamp_end)
    precio_final = precio_incluyendo_condicion(1, stamp_start, stamp_end)
    precio_final += precio_incluyendo_condicion(2, stamp_start, stamp_end)
    resto_horas = horas_totales(stamp_start, stamp_end) / SECONDS_PER_HOUR
    precio_final += (resto_horas * precio_hora)
    precio_final
  end

  def horas_en_condicion(condicion, stamp_start, stamp_end)
    case condicion["tipo"]
    when "hora"
      horas = calcular_horas(condicion, stamp_start, stamp_end)
    when "dia"
      horas = calculas_horas_con_dias(condicion, stamp_stat, stamp_end)
    end
    horas
  end

  private

  def horas_totales(stamp_start, stamp_end)
    horas1 = horas_en_condicion(condicion_extra1, stamp_start, stamp_end)
    horas2 = horas_en_condicion(condicion_extra2, stamp_start, stamp_end)
    (stamp_end - stamp_start) - (horas1.to_i + horas2.to_i)
  end

  def calcular_horas(condicion, stamp_start, stamp_end)
    condicion_inicio = Time.strptime(
      stamp_start.strftime("%Y-%m-%d") + " " + condicion["hora_inicio"],
      "%Y-%m-%d %H:%M"
    )
    condicion_fin = Time.strptime(
      stamp_end.strftime("%Y-%m-%d") + " " + condicion["hora_fin"],
      "%Y-%m-%d %H:%M"
    )
    condicion_fin += 1.day if condicion_fin < condicion_inicio
    return 0 if condiciones_no_cumplidas(
      condicion_inicio, condicion_fin, stamp_start, stamp_end
    )

    hora_inicio = stamp_start > condicion_inicio ? stamp_start : condicion_inicio
    hora_fin = stamp_end < condicion_fin ? stamp_end : condicion_fin
    (hora_fin - hora_inicio).abs
  end

  def condiciones_no_cumplidas(condicion_inicio, condicion_fin, stamp_start, stamp_end)
    nocond1 = (stamp_end < condicion_inicio && stamp_start < condicion_inicio)
    nocond2 = (stamp_start > condicion_fin && stamp_end > condicion_fin)

    nocond1 || nocond2
  end

  def calcular_horas_con_dias(*)
    0 # TODO: Implement this method if needed.
  end

  def precio_incluyendo_condicion(condicion, stamp_start, stamp_end)
    condicion_extra = condicion == 1 ? condicion_extra1 : condicion_extra2
    horas = horas_en_condicion(condicion_extra, stamp_start, stamp_end)
    return 0 if horas.blank?

    precio = precio_por_condicion(horas, condicion)
    precio * (horas / SECONDS_PER_HOUR)
  end

  def precio_por_condicion(horas, condicion)
    precio = 0
    if horas.positive? && condicion == 1
      precio = costo_extra1 + precio_hora
    elsif horas.positive? && condicion == 2
      precio = costo_extra2 + precio_hora
    end
    precio
  end

  def descripcion_present?
    descripcion.present?
  end
end
