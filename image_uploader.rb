def image_upload(model, column, img)
  if img
    logger.info "upload now"
    tempfile = img[:tempfile]

    upload = Cloudinary::Uploader.upload(tempfile.path)

    model.update_attribute(column, upload['url'])
  end
end

def image_upload_local(model, column, img)
  if img
    logger.info img
    id = model.id
    ext = File.extname(img[:filename])
    image_name = "#{id}-bbs#{ext}"
    p "="*20
    logger.info ext
    img_path = "/images/bbs/#{img_name}"
    model.update_attribute(column, img_path)

    save_path = File.join('public', 'images', 'bbs', img_name)

    File.open(save_path, 'wb') do |f|
     logger.info "Temp file: #{img[:tempfile]}"
     f.write img[:tempfile].read
     logger.info 'アップロード成功'
    end
  else
    logger.info 'アップロード失敗'
  end
end
