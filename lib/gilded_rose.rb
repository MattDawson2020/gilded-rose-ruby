require_relative 'items'

class GildedRose

  def initialize(items)
    @items = items
  end

  def old_update()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
      else
        if item.quality < 50
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
    end
  end


  def update_quality
    @items.each do |item|
      if item.name == "Aged Brie"
        increase_quality(item)
        item.sell_in -= 1
      elsif item.name == "Sulfuras, Hand of Ragnaros"
        #logic
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        update_pass(item)
        item.sell_in -= 1
      elsif item.name == "Conjured"
        2.times { update_regular(item) }
        item.sell_in -= 1
      else
        update_regular(item)
        item.sell_in -= 1
      end
    end
  end

  


  private 

  def increase_quality(item)
    fail "Cannot exceed maximum quality" if item.quality >= 50
    item.quality += 1
  end

  def update_pass(item)
    if item.sell_in <= 0
      item.quality = 0
    elsif item.sell_in <= 5
      item.quality += 3
    elsif item.sell_in.between?(5,10)
      item.quality += 2
    end
  end

  def update_regular(item)
    if item.sell_in <= 0
      item.quality -= 2
    else
      item.quality -= 1
    end
  end

end

