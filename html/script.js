function displayNotification(message, icon, color, duration) {
    const container = document.querySelector('.notification-container');
    const messageElement = document.querySelector('.notification-message');
    const iconElement = document.querySelector('.notification-icon');

    container.style.backgroundColor = color;
    messageElement.textContent = message;
    iconElement.className = 'notification-icon ' + icon;

    container.style.display = 'block';

    setTimeout(() => {
        container.style.display = 'none';
    }, duration);
}

function handleNotification(data) {
    const { message, icon, color, duration } = data;
    displayNotification(message, icon, color, duration);
}

window.addEventListener('message', (event) => {
    if (event.data.type === 'notification') {
        handleNotification(event.data);
    }
});
