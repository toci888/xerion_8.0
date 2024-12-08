import React, { useEffect, useState } from 'react';

const register-pop-up = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('register-pop-up mounted');
    }, []);

    return (
        <div>
            <h1>register-pop-up Component</h1>
        </div>
    );
};

export default register-pop-up;
