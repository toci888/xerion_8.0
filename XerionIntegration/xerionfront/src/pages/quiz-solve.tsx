import React, { useEffect, useState } from 'react';

const quiz-solve = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('quiz-solve mounted');
    }, []);

    return (
        <div>
            <h1>quiz-solve Component</h1>
        </div>
    );
};

export default quiz-solve;
