import React, { useEffect, useState } from 'react';

const app = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('app mounted');
    }, []);

    return (
        <div>
            <h1>app Component</h1>
        </div>
    );
};

export default app;
