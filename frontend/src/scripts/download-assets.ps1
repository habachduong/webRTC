# Tạo thư mục assets nếu chưa tồn tại
$assetsDir = Join-Path $PSScriptRoot "../asset"
if (-not (Test-Path $assetsDir)) {
    New-Item -ItemType Directory -Path $assetsDir -Force
}

# Danh sách assets cần tải
$assets = @{
    # Icons chính
    "profile.png" = "https://cdn-icons-png.flaticon.com/512/1077/1077114.png"
    "setting.png" = "https://cdn-icons-png.flaticon.com/512/2099/2099058.png"
    "admin.png" = "https://cdn-icons-png.flaticon.com/512/2206/2206368.png"
    "trunk.png" = "https://cdn-icons-png.flaticon.com/512/1785/1785211.png"
    "service.png" = "https://cdn-icons-png.flaticon.com/512/1785/1785211.png"
    "sip.png" = "https://cdn-icons-png.flaticon.com/512/1785/1785211.png"
    "queue.png" = "https://cdn-icons-png.flaticon.com/512/1785/1785211.png"
    "report.png" = "https://cdn-icons-png.flaticon.com/512/1785/1785211.png"

    # Icons báo cáo
    "cdr.png" = "https://cdn-icons-png.flaticon.com/512/1785/1785211.png"
    "billing.png" = "https://cdn-icons-png.flaticon.com/512/1785/1785211.png"
    "queue-report.png" = "https://cdn-icons-png.flaticon.com/512/1785/1785211.png"
    "service-report.png" = "https://cdn-icons-png.flaticon.com/512/1785/1785211.png"

    # Icons phụ
    "arrow-down.png" = "https://cdn-icons-png.flaticon.com/512/2989/2989988.png"
    "dashboard.png" = "https://cdn-icons-png.flaticon.com/512/1785/1785211.png"
}

Write-Host "Bắt đầu tải assets..." -ForegroundColor Green

foreach ($asset in $assets.GetEnumerator()) {
    $filename = $asset.Key
    $url = $asset.Value
    $filepath = Join-Path $assetsDir $filename

    try {
        Write-Host "Đang tải: $filename" -ForegroundColor Yellow
        Invoke-WebRequest -Uri $url -OutFile $filepath
        Write-Host "Đã tải xong: $filename" -ForegroundColor Green
    }
    catch {
        Write-Host "Lỗi khi tải $filename`: $_" -ForegroundColor Red
    }
}

Write-Host "Hoàn thành tải assets!" -ForegroundColor Green 