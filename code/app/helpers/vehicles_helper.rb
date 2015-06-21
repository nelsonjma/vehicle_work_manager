module VehiclesHelper

  def vehicle_type_list
    VehicleType.all.collect { |vt| [vt.name, vt.id] }
  end

end
