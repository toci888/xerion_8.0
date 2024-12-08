import React, { useEffect, useState } from 'react';

const company-page = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('company-page mounted');
    }, []);

    return (
        <div>
            <h1>company-page Component</h1>
        </div>
    );
};

export default company-page;
