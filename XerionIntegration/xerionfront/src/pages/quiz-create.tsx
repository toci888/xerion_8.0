import React, { useEffect, useState } from 'react';

const quiz-create = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('quiz-create mounted');
    }, []);

    return (
        <div>
            <h1>quiz-create Component</h1>
        </div>
    );
};

export default quiz-create;
