module ApplicationHelper
  def avatar_from_name(name)
    "https://ui-avatars.com/api/?font-size=0.5&size=300&bold=true&background=FB923C&color=FFF&name=#{name}"
  end

  def admin_namespace?
    request.path.start_with?('/admin')
  end

  def rupiah(price)
    delimiter_regex = /(\d)(?=(\d{3})+(?!\d))/
    "Rp#{price.to_s.gsub(delimiter_regex, '\\1.')}"
  end

  def order_ticket_url(name:, price:)
    "https://api.whatsapp.com/send?phone=6281294067368&text=Halo%20Admin%2C%20saya%20ingin%20memesan%20tiket%20#{name}%20dengan%20harga%20#{price}"
  end
end
