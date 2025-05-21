const https = require('https');
const fs = require('fs');
const path = require('path');

const ASSETS_DIR = path.join(__dirname, '../asset');

// Tạo thư mục assets nếu chưa tồn tại
if (!fs.existsSync(ASSETS_DIR)) {
  fs.mkdirSync(ASSETS_DIR, { recursive: true });
}

const ASSETS = {
  // Icons chính
  'profile.png': 'https://cdn-icons-png.flaticon.com/512/1077/1077114.png',
  'setting.png': 'https://cdn-icons-png.flaticon.com/512/2099/2099058.png',
  'admin.png': 'https://cdn-icons-png.flaticon.com/512/2206/2206368.png',
  'trunk.png': 'https://cdn-icons-png.flaticon.com/512/1785/1785211.png',
  'service.png': 'https://cdn-icons-png.flaticon.com/512/1785/1785211.png',
  'sip.png': 'https://cdn-icons-png.flaticon.com/512/1785/1785211.png',
  'queue.png': 'https://cdn-icons-png.flaticon.com/512/1785/1785211.png',
  'report.png': 'https://cdn-icons-png.flaticon.com/512/1785/1785211.png',

  // Icons báo cáo
  'cdr.png': 'https://cdn-icons-png.flaticon.com/512/1785/1785211.png',
  'billing.png': 'https://cdn-icons-png.flaticon.com/512/1785/1785211.png',
  'queue-report.png': 'https://cdn-icons-png.flaticon.com/512/1785/1785211.png',
  'service-report.png': 'https://cdn-icons-png.flaticon.com/512/1785/1785211.png',

  // Icons phụ
  'arrow-down.png': 'https://cdn-icons-png.flaticon.com/512/2989/2989988.png',
  'dashboard.png': 'https://cdn-icons-png.flaticon.com/512/1785/1785211.png'
};

function downloadFile(url, filename) {
  return new Promise((resolve, reject) => {
    const filepath = path.join(ASSETS_DIR, filename);
    const file = fs.createWriteStream(filepath);

    https.get(url, (response) => {
      response.pipe(file);
      file.on('finish', () => {
        file.close();
        console.log(`Đã tải xong: ${filename}`);
        resolve();
      });
    }).on('error', (err) => {
      fs.unlink(filepath, () => {});
      reject(err);
    });
  });
}

async function downloadAllAssets() {
  console.log('Bắt đầu tải assets...');
  
  for (const [filename, url] of Object.entries(ASSETS)) {
    try {
      await downloadFile(url, filename);
    } catch (err) {
      console.error(`Lỗi khi tải ${filename}:`, err.message);
    }
  }
  
  console.log('Hoàn thành tải assets!');
}

downloadAllAssets(); 