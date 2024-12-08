import React, { useEffect, useState } from 'react';

const landing-page = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('landing-page mounted');
    }, []);

    return (
        <div>
            <h1>landing-page Component</h1>
        </div>
    );
};

export default landing-page;
