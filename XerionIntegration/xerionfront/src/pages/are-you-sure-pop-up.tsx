import React, { useEffect, useState } from 'react';

const are-you-sure-pop-up = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('are-you-sure-pop-up mounted');
    }, []);

    return (
        <div>
            <h1>are-you-sure-pop-up Component</h1>
        </div>
    );
};

export default are-you-sure-pop-up;
