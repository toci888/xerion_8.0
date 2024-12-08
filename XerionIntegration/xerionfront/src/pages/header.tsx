import React, { useEffect, useState } from 'react';

const header = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('header mounted');
    }, []);

    return (
        <div>
            <h1>header Component</h1>
        </div>
    );
};

export default header;
