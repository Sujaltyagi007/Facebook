<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
    font-family: 'Helvetica Neue', Arial, sans-serif;
    background-color: #f0f2f5;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Container styles */
.container {
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    width: 90%;
    max-width: 500px;
    text-align: center;
}

/* Heading styles */
h1 {
    color: #333;
    margin-bottom: 25px;
    font-size: 24px;
}

/* Friends list styles */
.friends-list {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

/* Friend card styles */
.friend-card {
    display: flex;
    align-items: center;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    transition: transform 0.2s, box-shadow 0.2s;
}

.friend-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
}

/* Friend image styles */
.friend-card img {
    border-radius: 50%;
    margin-right: 15px;
    width: 60px;
    height: 60px;
    object-fit: cover;
}

/* Friend name styles */
.friend-card span {
    font-size: 18px;
    font-weight: 500;
    color: #555;
}

/* Button styles */
.friend-card button {
    margin-left: auto;
    padding: 8px 16px;
    border: none;
    border-radius: 5px;
    background: #007bff;
    color: white;
    cursor: pointer;
    transition: background 0.3s;
}

.friend-card button:hover {
    background: #0056b3;
}

.friend-card button:disabled {
    background: #ccc;
    cursor: not-allowed;
}

/* Responsive styles */
@media (max-width: 768px) {
    .friend-card {
        flex-direction: column;
        align-items: flex-start;
        text-align: left;
    }
    .friend-card img {
        margin-bottom: 10px;
    }
    .friend-card span {
        margin-bottom: 10px;
    }
    .friend-card button {
        width: 100%;
    }
}
</style>
<body>
     <div class="container">
        <h1>My Friends</h1>
        <div class="friends-list">
            <!-- Friend cards will go here -->
        </div>
    </div>
</body>
<script type="text/javascript">
const friends = [
    { name: 'Alice', img: 'https://via.placeholder.com/60', isFriend: false },
    { name: 'Bob', img: 'https://via.placeholder.com/60', isFriend: true },
    { name: 'Charlie', img: 'https://via.placeholder.com/60', isFriend: false },
];

const friendsList = document.querySelector('.friends-list');

friends.forEach(friend => {
    const friendCard = document.createElement('div');
    friendCard.classList.add('friend-card');
    
    const img = document.createElement('img');
    img.src = friend.img;
    img.alt = `${friend.name}'s picture`;
    
    const name = document.createElement('span');
    name.textContent = friend.name;
    
    const button = document.createElement('button');
    button.textContent = friend.isFriend ? 'Following' : 'Add Friend';
    button.disabled = friend.isFriend;

    button.addEventListener('click', () => {
        friend.isFriend = true;
        button.textContent = 'Following';
        button.disabled = true;
    });
    
    friendCard.appendChild(img);
    friendCard.appendChild(name);
    friendCard.appendChild(button);
    
    friendsList.appendChild(friendCard);
});
</script>
</html>