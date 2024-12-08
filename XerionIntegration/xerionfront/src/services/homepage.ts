import axios from 'axios';

const homepage = async () => {
    const response = await axios.get('https://api.example.com');
    return response.data;
};

export default homepage;
