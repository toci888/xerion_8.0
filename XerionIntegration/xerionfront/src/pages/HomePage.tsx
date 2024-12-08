import React, { useEffect, useState } from 'react';

const homepage = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('homepage mounted');
    }, []);

    return (
        <div>
            <h1>homepage Component</h1>
        </div>
    );
};

export default homepage;
