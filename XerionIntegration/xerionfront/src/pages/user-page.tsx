import React, { useEffect, useState } from 'react';

const user-page = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('user-page mounted');
    }, []);

    return (
        <div>
            <h1>user-page Component</h1>
        </div>
    );
};

export default user-page;
