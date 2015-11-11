# 加工した水を作るインタフェース
# - add_material: 素材（砂糖、塩）を加える
# - add_water: 水を加える
# - result: 水の状態を返す
class WaterWithMaterialBuilder
  def initialize(class_name)
    @water_with_material = class_name.new(0, 0)
  end

  def add_material(material_amount)
    @water_with_material.add_material(material_amount)
  end

  def add_water(water_amount)
    @water_with_material.water += water_amount
  end

  def result
    @water_with_material
  end
end
