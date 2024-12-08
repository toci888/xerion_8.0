import axios from 'axios';

const company-page = async () => {
    const response = await axios.get('https://api.example.com');
    return response.data;
};

export default company-page;
