import axios from 'axios';

const landing-page = async () => {
    const response = await axios.get('https://api.example.com');
    return response.data;
};

export default landing-page;
