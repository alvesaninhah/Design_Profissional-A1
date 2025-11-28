const cidadeImaginaria = [-23.9917, -46.3029]; 
const map = L.map('map').setView(cidadeImaginaria, 13);
L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: 'Mapa fictício com Leaflet & OpenStreetMap',
}).addTo(map);

L.marker(cidadeImaginaria)
    .addTo(map)
    .bindPopup('<b>Barcos de Luxo</b><br>Ponte Edgard Perdigão - Ponta da Praia, Santos - SP.')
    .openPopup();
