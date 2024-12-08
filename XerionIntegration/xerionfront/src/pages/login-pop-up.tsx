import React, { useEffect, useState } from 'react';

const login-pop-up = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('login-pop-up mounted');
    }, []);

    return (
        <div>
            <h1>login-pop-up Component</h1>
        </div>
    );
};

export default login-pop-up;
