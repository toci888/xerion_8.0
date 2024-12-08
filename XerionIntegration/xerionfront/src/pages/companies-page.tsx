import React, { useEffect, useState } from 'react';

const companies-page = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('companies-page mounted');
    }, []);

    return (
        <div>
            <h1>companies-page Component</h1>
        </div>
    );
};

export default companies-page;
