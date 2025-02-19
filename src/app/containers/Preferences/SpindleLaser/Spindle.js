import React from 'react';

import TooltipCustom from 'app/components/TooltipCustom/ToolTip';

import Fieldset from '../components/Fieldset';
import Input from '../components/Input';

const Spindle = ({ state, actions }) => {
    const { spindle } = state;
    const { spindleMin, spindleMax } = spindle;
    const spindleActions = actions.spindle;

    return (
        <>
            <Fieldset legend="Spindle Speed">
                <TooltipCustom content="Minimum spindle amount" location="default">
                    <Input
                        label="Minimum Speed"
                        units="RPM"
                        value={spindleMin}
                        onChange={(e) => spindleActions.setSpeed(e.target.value, 'spindleMin')}
                        additionalProps={{ type: 'number' }}
                    />
                </TooltipCustom>
                <TooltipCustom content="Maximum spindle speed" location="default">
                    <Input
                        label="Maximum Speed"
                        units="RPM"
                        value={spindleMax}
                        onChange={(e) => spindleActions.setSpeed(e.target.value, 'spindleMax')}
                        additionalProps={{ type: 'number' }}
                    />
                </TooltipCustom>
            </Fieldset>
        </>
    );
};

export default Spindle;
