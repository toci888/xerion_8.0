import axios from 'axios';

const user-service = async () => {
    const response = await axios.get('https://api.example.com');
    return response.data;
};

export default user-service;
